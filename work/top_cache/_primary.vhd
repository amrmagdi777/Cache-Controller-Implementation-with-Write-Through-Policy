library verilog;
use verilog.vl_types.all;
entity top_cache is
    generic(
        WIDTH           : integer := 32;
        ADDRESS         : integer := 10
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        addr            : in     vl_logic_vector;
        data_in         : in     vl_logic_vector;
        stall           : out    vl_logic;
        data_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDRESS : constant is 1;
end top_cache;
