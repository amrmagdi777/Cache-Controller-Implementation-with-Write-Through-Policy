module cashe_memory(input clk,
                    input reset,
                    input mem_read,
                    input mem_write,
                    input [9 : 0] word_address,
                    input [31 : 0]data_in,
                    output reg stall,
                    output reg [31 : 0] data_out);

reg [31 : 0] mem [127 : 0][7:0];
reg [31 : 0] cashe [127 : 0];
reg  valid [127:0] ;
reg [2:0] tag [127:0];
wire [6:0] add_of_word ;
wire [2:0] add_of_block ;
integer i ;
reg [1:0] state = 2'b00;
reg ready = 1'b0;


reg i_1;
reg i_2;

always @(posedge clk) begin
 
if (reset) begin
    for( i=0;i<128;i=i+1 ) begin 
             valid [i]= 1'b0; 
              tag[i] =3'b000; 
                      end


end
else begin 
    

  case(state)
    2'b00 : begin
            if (mem_read == 1'b1) state = 2'b01;
           else if (mem_write == 1'b1) state = 2'b10;
           else state = 2'b00;
           mem[5][1] = 10;
            end
   2'b01 : begin
              case (ready)
              1'b0 : begin  if (valid[add_of_word] == 1'b1 & tag[add_of_word] == word_address[9:7] ) begin
                                      stall = 1'b0;                                
                                      data_out = cashe [add_of_word];
                                        state = 2'b00;
                                               end // if
                               else begin
                                       ready = 1'b1;
                                       stall = 1'b1;
                                     end //else
                     end //case ready = 0 

                 1'b1 : begin                     
             cashe  [add_of_word] = mem [add_of_word][add_of_block];                                                       
                               valid[add_of_word] = 1'b1;
                               tag[add_of_word] = add_of_block;
        ready = 1'b0;
                             
                          end // case ready = 1                  

                  endcase // read case

end  // read

2'b10 : begin

             
       end // write













  endcase



     end //else






end    // always


assign add_of_word = word_address[6:0];
assign  add_of_block = word_address [9 : 7];



endmodule