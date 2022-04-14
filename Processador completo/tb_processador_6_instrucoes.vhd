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
          reset: in std_logic;
          data: in std_logic_vector(15 downto 0);
          PC: out std_logic_vector(15 downto 0);
          I_rd: out  std_logic);
    end component;
    
    component memoryI is
    Port ( addr : in STD_LOGIC_VECTOR (15 downto 0);
           rd : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal clk, reset: std_logic := '0';
    signal data:  std_logic_vector(15 downto 0);
    signal PC:  std_logic_vector(15 downto 0);
    signal I_rd:   std_logic;
    
    constant period: time := 5 ns;
begin
    
    processador: processador_6_instrucoes port map 
                 (clk => clk,
                  reset => reset,
                  data => data,
                  PC => PC,
                  I_rd => I_rd);
    memoria_I: memoryI port map 
         ( addr => PC,
           rd => I_rd,
           data => data);
    
    clk <= not clk after period/2;
    reset <= '1', '0' after period; 
    
end Behavioral;
