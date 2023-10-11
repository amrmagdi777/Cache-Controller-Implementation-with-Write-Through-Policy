library verilog;
use verilog.vl_types.all;
entity risc_top is
    generic(
        WIDTH           : integer := 32
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end risc_top;
