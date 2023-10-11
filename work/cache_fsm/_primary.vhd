library verilog;
use verilog.vl_types.all;
entity cache_fsm is
    generic(
        DEPTH           : integer := 128
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        addr            : in     vl_logic_vector(9 downto 0);
        ready           : in     vl_logic;
        counter_out     : out    vl_logic_vector(1 downto 0);
        stall           : out    vl_logic;
        cach_write      : out    vl_logic;
        main_read       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
end cache_fsm;
