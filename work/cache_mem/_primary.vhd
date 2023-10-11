library verilog;
use verilog.vl_types.all;
entity cache_mem is
    generic(
        WIDTH           : integer := 32;
        DEPTH           : integer := 128;
        ADDRESS         : integer := 7
    );
    port(
        clk             : in     vl_logic;
        mem_read        : in     vl_logic;
        cach_write      : in     vl_logic;
        miss_read       : in     vl_logic;
        counter         : in     vl_logic_vector(1 downto 0);
        data_in         : in     vl_logic_vector;
        read_cache_data : in     vl_logic_vector;
        addr            : in     vl_logic_vector;
        data_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of ADDRESS : constant is 1;
end cache_mem;
