library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        pc              : in     vl_logic_vector(31 downto 0);
        imm_ext         : in     vl_logic_vector(31 downto 0);
        pc_target       : out    vl_logic_vector(31 downto 0)
    );
end adder;
