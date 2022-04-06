----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 03:58:01 PM
-- Design Name: 
-- Module Name: memI_tb - Behavioral
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

entity memI_tb is
--  Port ( );
end memI_tb;

architecture Behavioral of memI_tb is


    component memoryI is
        Port ( clk  : in STD_LOGIC;
               addr : in STD_LOGIC_VECTOR (15 downto 0);
               rd : in STD_LOGIC;
               data : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    signal clk  : STD_LOGIC;
    signal addr : STD_LOGIC_VECTOR (15 downto 0);
    signal rd   : STD_LOGIC;
    signal data : STD_LOGIC_VECTOR (15 downto 0);
    
begin

map_memI: memoryI port map (clk, addr, rd, data);

clk_stim: process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

memI_stim: process
begin
    addr <= X"0000";
    rd <= '1';
    wait for 10 ns;
    addr<= X"0001";
    wait for 10 ns;
    addr<= X"0002";
    wait for 10 ns;
    addr<= X"0003";
    wait for 10 ns;
    addr<= X"0004";
    wait for 10 ns;
    addr<= X"0005";
    wait for 10 ns;
end process;

end Behavioral;
