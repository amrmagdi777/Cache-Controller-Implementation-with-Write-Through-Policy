library verilog;
use verilog.vl_types.all;
entity alu is
    generic(
        WIDTH           : integer := 32
    );
    port(
        srcA            : in     vl_logic_vector;
        srcB            : in     vl_logic_vector;
        alu_ctrl        : in     vl_logic_vector(2 downto 0);
        alu_res         : out    vl_logic_vector;
        zero            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end alu;
