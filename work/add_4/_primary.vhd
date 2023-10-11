library verilog;
use verilog.vl_types.all;
entity add_4 is
    generic(
        WIDTH           : integer := 32
    );
    port(
        in1             : in     vl_logic_vector;
        pc_next         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end add_4;
