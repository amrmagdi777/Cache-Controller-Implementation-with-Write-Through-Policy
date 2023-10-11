library verilog;
use verilog.vl_types.all;
entity reg_file is
    generic(
        Addr            : integer := 5;
        WIDTH           : integer := 32;
        DEPTH           : integer := 32
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        WE              : in     vl_logic;
        read_address1   : in     vl_logic_vector;
        read_address2   : in     vl_logic_vector;
        write_address   : in     vl_logic_vector;
        write_data      : in     vl_logic_vector;
        read_data1      : out    vl_logic_vector;
        read_data2      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Addr : constant is 1;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
end reg_file;
