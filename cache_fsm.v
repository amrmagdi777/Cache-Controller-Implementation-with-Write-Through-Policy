module cache_fsm #(parameter DEPTH = 128) (
    input wire clk,
    input wire rst,
    input wire mem_read,
    input wire mem_write,
    input wire [9:0] addr,
    input wire ready,
    output wire [1:0] counter_out,
    output reg stall,
    output reg cach_write,
    output reg main_read
);

localparam IDLE = 2'b00 ;
localparam READING = 2'b01 ;
localparam WRITING = 2'b10 ;

reg [1:0] curr_state,next_state;
reg [1:0] counter;

reg valid [DEPTH-1:0];
reg [2:0] tag [DEPTH-1:0];

wire hit_read_check,hit_write_check;

integer I;

always @(negedge clk or negedge rst) begin
    if(!rst) begin
        for(I = 0;I < DEPTH;I = I+1) begin
          valid[I] <= 1'b0;
        end 
        curr_state <= IDLE;      
    end
    else begin
        curr_state <= next_state;
    end
end

always @(negedge clk or negedge rst) begin
    if(!rst) begin
        counter <= 2'b00;
    end
    else begin
        if((curr_state != 2'b00) && counter < 2'b11)
        counter <= counter +1;
        else
        counter <= 2'b00;
    end
end

always @(*) begin
    case(curr_state)
    IDLE : begin
        if(mem_read) begin
            if(hit_read_check) begin
                next_state = IDLE;
            end
            else begin
                next_state = READING;
            end
        end
        else if(mem_write) begin
            next_state = WRITING;
        end
        else begin
            next_state = IDLE;
        end
    end
    READING : begin
        if(ready) begin
            next_state = IDLE;
        end
        else begin
            next_state = READING;
        end
    end
    WRITING : begin
        if(counter == 2'b11) begin
            next_state = IDLE;
        end
        else begin
            next_state = WRITING;
        end
    end 
    default : next_state = IDLE;   
    endcase
end

always @(*) begin
    case(curr_state)
    IDLE : begin
        stall = 1'b0;
        main_read = 1'b0;
        cach_write = 1'b0;
    end
    READING : begin
        stall = 1'b1;
        main_read = 1'b1;
        cach_write = 1'b0;
        case(counter)
        2'b00 : begin
            valid[{addr[6:2],2'b00}] = 1'b1;
            tag[{addr[6:2],2'b00}] = addr[9:7];
        end
        2'b01 : begin
            valid[{addr[6:2],2'b01}] = 1'b1;
            tag[{addr[6:2],2'b01}] = addr[9:7];
        end
        2'b10 : begin
            valid[{addr[6:2],2'b10}] = 1'b1;
            tag[{addr[6:2],2'b10}] = addr[9:7];
        end
        2'b11 : begin
            valid[{addr[6:2],2'b11}] = 1'b1;
            tag[{addr[6:2],2'b11}] = addr[9:7];
        end                        
        endcase
    end
    WRITING : begin
        stall = 1'b1;
        main_read = 1'b0;
        if(hit_write_check) begin
            cach_write = 1'b1;
            tag[addr[6:0]] = addr[9:7];          
        end
        else begin
            cach_write = 1'b0;
        end

    end    
    default : begin
        stall = 1'b0;
        main_read = 1'b0;
        cach_write = 1'b0;
    end
    endcase
end


assign hit_read_check = (valid[addr[6:0]] == 1 && tag[addr[6:0]] == addr[9:7]) ? 1 : 0;
assign hit_write_check = (valid[addr[6:0]] == 1) ? 1 : 0;
assign counter_out = counter;

endmodule