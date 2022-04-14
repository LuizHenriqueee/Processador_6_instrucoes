library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bloco_operacional is
    Port ( clk: in STD_LOGIC;
           R_DR_data: in STD_LOGIC_VECTOR(15 downto 0);
           RF_W_data : in STD_LOGIC_VECTOR (7 downto 0);
           RF_s1 : in STD_LOGIC;
           RF_s0 : in STD_LOGIC;
           RF_W_addr : in STD_LOGIC_VECTOR (3 downto 0);
           RF_W_wr : in STD_LOGIC;
           RF_Rp_addr : in STD_LOGIC_VECTOR (3 downto 0);
           RF_Rp_rd : in STD_LOGIC;
           RF_Rq_addr : in STD_LOGIC_VECTOR (3 downto 0);
           RF_Rq_rd : in STD_LOGIC;
           alu_s1 : in STD_LOGIC;
           alu_s0 : in STD_LOGIC;
           W_DR_data: out STD_LOGIC_VECTOR (15 downto 0);
           RF_Rp_zero : out STD_LOGIC);
end bloco_operacional;

architecture Behavioral of bloco_operacional is

    component MUX3x1 is
    Port ( in_0 : in STD_LOGIC_VECTOR (15 downto 0);
           in_1 : in STD_LOGIC_VECTOR (15 downto 0);
           in_2 : in STD_LOGIC_VECTOR (7 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           mux3x1_out : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    component RegisterFile is
    Port ( clk : in STD_LOGIC;
           W_RF_data : in STD_LOGIC_VECTOR (15 downto 0);
           W_addr : in STD_LOGIC_VECTOR (3 downto 0);
           W_wr : in STD_LOGIC;
           Rp_addr : in STD_LOGIC_VECTOR (3 downto 0);
           Rp_rd : in STD_LOGIC;
           Rq_addr : in STD_LOGIC_VECTOR (3 downto 0);
           Rq_rd : in STD_LOGIC;
           Rp_data : out STD_LOGIC_VECTOR (15 downto 0);
           Rq_data : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    component ALU is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           alu_s1 : in STD_LOGIC;
           alu_s0 : in STD_LOGIC;
           alu_out : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    component flag0 is
	port(	a: in STD_LOGIC_VECTOR(15 downto 0);
			y: out STD_LOGIC);
    end component;

    signal s_alu_out, s_mux3x1, s_Rp_data, s_Rq_data : STD_LOGIC_VECTOR (15 downto 0);
begin

    -- Multiplexador de 3 entradas
    MUX_3x1: MUX3x1 port map
         ( in_0 => s_alu_out,
           in_1 => R_DR_data,
           in_2 => RF_W_data,
           s0 => RF_s0,
           s1 => RF_s1,
           mux3x1_out => s_mux3x1);

    -- Banco de registradores
    RF: RegisterFile port map
                ( clk => clk,
                  W_RF_data => s_mux3x1,
                  W_addr => RF_W_addr,
                  W_wr => RF_W_wr,
                  Rp_addr => RF_Rp_addr,
                  Rp_rd => RF_Rp_rd,
                  Rq_addr => RF_Rq_addr,
                  Rq_rd => RF_Rq_rd,
                  Rp_data => s_Rp_data,
                  Rq_data => s_Rq_data);


    -- Unidade de operação logica e aritmetica
     myalu: ALU port map
         ( A => s_Rp_data,
           B => s_Rq_data,
           alu_s1 => alu_s1,
           alu_s0 => alu_s0,
           alu_out => s_alu_out);

    -- Identifica se a entrada é igual a 0
    zerp_flag: flag0 port map
            ( a => s_Rp_data,
			  y => RF_Rp_zero);

    -- Entrada da memoria D, na operação de escrita de constante
    W_DR_data <= s_Rp_data;
end Behavioral;
