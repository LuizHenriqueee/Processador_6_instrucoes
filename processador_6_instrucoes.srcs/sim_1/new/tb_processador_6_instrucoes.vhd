----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2022 03:48:14
-- Design Name: 
-- Module Name: tb_processador_6_instrucoes - Behavioral
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

entity tb_processador_6_instrucoes is
--  Port ( );
end tb_processador_6_instrucoes;

architecture Behavioral of tb_processador_6_instrucoes is
    
    component processador_6_instrucoes is
    Port (clk: in std_logic;
          clk_Imem: in std_logic;
          clk_Dmem: in std_logic;
          reset: in std_logic);
    end component;
    
    signal clk, reset, clk_Imem, clk_Dmem : std_logic := '0';
    constant period: time := 10 ns;
begin
    
    utt: processador_6_instrucoes port map 
         (clk => clk,
          clk_Imem => clk_Imem,
          clk_Dmem => clk_Dmem,
          reset => reset);
    
    clk <= not clk after period/2;
    clk_Imem <= not clk_Imem after period/5;
    clk_Dmem <= not clk_Dmem after period/10;
    reset <= '1', '0' after period; 
    
end Behavioral;
