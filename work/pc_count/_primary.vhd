library verilog;
use verilog.vl_types.all;
entity pc_count is
    generic(
        WIDTH           : integer := 32
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        stall           : in     vl_logic;
        pc_next         : in     vl_logic_vector;
        pc              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end pc_count;
