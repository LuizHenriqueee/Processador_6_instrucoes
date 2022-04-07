----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2022 03:47:00
-- Design Name: 
-- Module Name: processador_6_instrucoes - Behavioral
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

entity processador_6_instrucoes is
    Port (clk: in std_logic;
          clk_Imem: in std_logic;
          clk_Dmem: in std_logic;
          reset: in std_logic);
end processador_6_instrucoes;

architecture Behavioral of processador_6_instrucoes is
    
  component top_level_controle is
  Port (clk, reset: in STD_LOGIC;
        clk_Imem: in std_logic;
	    RF_Rp_zero: in STD_LOGIC;
	    D_addr, RF_W_data: out STD_LOGIC_VECTOR(7 downto 0);
	    RF_W_addr, RF_Rp_addr, RF_Rq_addr: out STD_LOGIC_VECTOR(3 downto 0);
	    D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0 : out STD_LOGIC); 
   end component;
   
  component top_level_operacional is
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
    end component;
     
     signal RF_Rp_zero, D_rd, D_wr, RF_s1, RF_s0,RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0: std_logic;
     signal RF_W_addr, RF_Rp_addr, RF_Rq_addr: std_logic_vector(3 downto 0);
     signal RF_W_data, D_addr: std_logic_vector(7 downto 0);
     
begin
     
     bloco_controle: top_level_controle port map 
       (clk => clk, 
        reset => reset,
        clk_Imem => clk_Imem,
	    RF_Rp_zero => RF_Rp_zero,
	    D_addr => D_addr, 
	    RF_W_data => RF_W_data,
	    RF_W_addr => RF_W_addr, 
	    RF_Rp_addr => RF_Rp_addr, 
	    RF_Rq_addr => RF_Rq_addr,
	    D_rd => D_rd, 
	    D_wr => D_wr, 
	    RF_s1 => RF_s1, 
	    RF_s0 => RF_s0, 
	    RF_W_wr => RF_W_wr, 
	    RF_Rp_rd => RF_Rp_rd, 
	    RF_Rq_rd => RF_Rq_rd, 
	    alu_s1 => alu_s1, 
	    alu_s0 => alu_s0);
     
     bloco_operacional: top_level_operacional port map 
       (D_addr => D_addr,
        D_rd => D_rd,
        D_wr => D_wr,
        clk => clk,
        clk_Dmem => clk_Dmem,
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
        RF_Rp_zero => RF_Rp_zero);
        

end Behavioral;