library verilog;
use verilog.vl_types.all;
entity cashe_memory is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        word_address    : in     vl_logic_vector(9 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        stall           : out    vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end cashe_memory;
