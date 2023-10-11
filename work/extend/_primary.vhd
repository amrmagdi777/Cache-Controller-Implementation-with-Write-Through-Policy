library verilog;
use verilog.vl_types.all;
entity extend is
    port(
        Instr           : in     vl_logic_vector(31 downto 7);
        imm_src         : in     vl_logic_vector(1 downto 0);
        ext             : out    vl_logic_vector(31 downto 0)
    );
end extend;
