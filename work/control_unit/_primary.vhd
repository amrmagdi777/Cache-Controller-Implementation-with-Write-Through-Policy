library verilog;
use verilog.vl_types.all;
entity control_unit is
    port(
        op              : in     vl_logic_vector(6 downto 0);
        funct3          : in     vl_logic_vector(2 downto 0);
        func7           : in     vl_logic;
        zero            : in     vl_logic;
        branch          : out    vl_logic;
        jump            : out    vl_logic;
        PC_Src          : out    vl_logic;
        Mem_Write       : out    vl_logic;
        Mem_Read        : out    vl_logic;
        Res_Src         : out    vl_logic_vector(1 downto 0);
        alu_ctrl        : out    vl_logic_vector(2 downto 0);
        Alu_Src         : out    vl_logic;
        Imm_Src         : out    vl_logic_vector(1 downto 0);
        Reg_Write       : out    vl_logic
    );
end control_unit;
