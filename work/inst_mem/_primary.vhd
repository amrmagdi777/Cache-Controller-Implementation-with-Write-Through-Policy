library verilog;
use verilog.vl_types.all;
entity inst_mem is
    generic(
        WIDTH           : integer := 32;
        DEPTH           : integer := 64
    );
    port(
        address         : in     vl_logic_vector;
        read_inst       : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
end inst_mem;
