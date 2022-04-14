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
          reset: in std_logic;
          data: in std_logic_vector(15 downto 0);
          PC: out std_logic_vector(15 downto 0);
          I_rd: out  std_logic);
          
end processador_6_instrucoes;

architecture Behavioral of processador_6_instrucoes is
    
  component unidade_de_controle is 
	port(	clk, reset: in STD_LOGIC;
			data: in STD_LOGIC_VECTOR(15 downto 0);
			RF_Rp_zero: in STD_LOGIC;
			PC: out STD_LOGIC_VECTOR(15 downto 0);
			I_rd: out STD_LOGIC;
			D_addr, RF_W_data: out STD_LOGIC_VECTOR(7 downto 0);
			RF_W_addr, RF_Rp_addr, RF_Rq_addr: out STD_LOGIC_VECTOR(3 downto 0);
			D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0 : out STD_LOGIC);
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
  
  component memD is
    Port ( clk : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (7 downto 0);
           D_rd : in STD_LOGIC;
           D_wr : in STD_LOGIC;
           W_data : in STD_LOGIC_VECTOR (15 downto 0);
           R_data : out STD_LOGIC_VECTOR (15 downto 0));
  end component;
     
     signal RF_Rp_zero, D_rd, D_wr, RF_s1, RF_s0,RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0: std_logic;
     signal RF_W_addr, RF_Rp_addr, RF_Rq_addr: std_logic_vector(3 downto 0);
     signal RF_W_data, D_addr: std_logic_vector(7 downto 0);
     signal R_DR_data, W_DR_data: std_logic_vector(15 downto 0);
     
begin
     
     bloco_controle: unidade_de_controle port map 
       (    clk=>clk, 
            reset => reset,
			data => data,
			RF_Rp_zero => RF_Rp_zero,
			PC => PC,
			I_rd => I_rd,
			D_addr => D_addr, 
			RF_W_data => RF_W_data,
			RF_W_addr => RF_W_addr, 
			RF_Rp_addr => RF_Rp_addr, 
			RF_Rq_addr =>RF_Rq_addr,
			D_rd => D_rd, 
			D_wr => D_wr, 
			RF_s1 => RF_s1, 
			RF_s0 => RF_s0, 
			RF_W_wr => RF_W_wr, 
			RF_Rp_rd => RF_Rp_rd, 
			RF_Rq_rd => RF_Rq_rd, 
			alu_s1 => alu_s1, 
			alu_s0 => alu_s0);
     
     my_bloco_operacional: bloco_operacional port map 
       (clk => clk,
        R_DR_data => R_DR_data,
        W_DR_data => W_DR_data,
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
        
     memoria_D: memD port map 
         ( clk => clk,
           addr => D_addr,
           D_rd => D_rd,
           D_wr => D_wr,
           W_data => W_DR_data,
           R_data => R_DR_data);
        

end Behavioral;
