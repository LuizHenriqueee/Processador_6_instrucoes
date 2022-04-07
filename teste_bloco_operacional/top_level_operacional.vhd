----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2022 15:23:08
-- Design Name: 
-- Module Name: top_level_operacional - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level_operacional is
  Port (D_addr : in STD_LOGIC_VECTOR (7 downto 0);
        D_rd : in STD_LOGIC;
        D_wr : in STD_LOGIC; 
        clk: in STD_LOGIC;
        clk_Dmem: in std_logic;
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
        RF_Rp_zero : out STD_LOGIC);
end top_level_operacional;

architecture Behavioral of top_level_operacional is
    
    component memD is
    Port ( clk : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (7 downto 0);
           D_rd : in STD_LOGIC;
           D_wr : in STD_LOGIC;
           W_data : in STD_LOGIC_VECTOR (15 downto 0);
           R_data : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component bloco_operacional is
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
    end component;
    
    signal s_W_data, s_R_data: std_logic_vector(15 downto 0);
    
begin
    memoryD: memD port map 
         ( clk => clk_Dmem,
           addr => D_addr,
           D_rd => D_rd,
           D_wr => D_wr,
           W_data => s_W_data,
           R_data => s_R_data);
    
    operating_block: bloco_operacional port map 
         ( clk => clk,
           R_DR_data => s_R_data,
           RF_W_data => RF_W_data,
           RF_s1 => RF_s1,
           RF_s0 => RF_s0,
           RF_W_addr => RF_W_addr,
           RF_W_wr => RF_W_wr,
           RF_Rp_addr => RF_Rp_addr,
           RF_Rp_rd => RF_Rp_rd,
           RF_Rq_addr => RF_Rq_addr,
           RF_Rq_rd => RF_Rq_rd,
           alu_s1 => alu_s1,
           alu_s0 => alu_s0,
           W_DR_data => s_W_data,
           RF_Rp_zero => RF_Rp_zero);

end Behavioral;
