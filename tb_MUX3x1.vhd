----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 12:09:26
-- Design Name: 
-- Module Name: tb_MUX3x1 - Behavioral
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


entity tb_MUX3x1 is
end tb_MUX3x1;

architecture Behavioral of tb_MUX3x1 is

    component MUX3x1 is
    Port ( in_0 : in STD_LOGIC_VECTOR (15 downto 0);
           in_1 : in STD_LOGIC_VECTOR (15 downto 0);
           in_2 : in STD_LOGIC_VECTOR (7 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           mux3x1_out : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    signal in_0, in_1: std_logic_vector(15 downto 0); 
    signal in_2: std_logic_vector(7 downto 0);
    signal s0, s1: std_logic;
    signal mux3x1_out: std_logic_vector(15 downto 0);
    
begin
    
    utt: MUX3x1 Port map 
        ( in_0 => in_0,
          in_1 => in_1,
          in_2 => in_2,
          s0 => s0,
          s1 => s1,
          mux3x1_out => mux3x1_out);
    
    -- stimulus
    in_0 <= "0000000000000001";
    in_1 <= "0000000000000010";
    in_2 <= "00000011", "11111110" after 30ns;
    s0 <= '0', '1' after 10 ns, '0' after 20ns;
    s1 <= '0', '0' after 10 ns, '1' after 20ns;

end Behavioral;
