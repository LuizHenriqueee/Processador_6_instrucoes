----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 12:55:05 PM
-- Design Name: 
-- Module Name: pcAdder_tb - Behavioral
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

entity pcAdder_tb is
--  Port ( );
end pcAdder_tb;

architecture Behavioral of pcAdder_tb is

component pcAdder is
    Port ( PC_in : in STD_LOGIC_VECTOR (15 downto 0);
           offset : in STD_LOGIC_VECTOR (7 downto 0);
           PC_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;
    
    signal PC_in :  STD_LOGIC_VECTOR (15 downto 0);
    signal offset : STD_LOGIC_VECTOR (7 downto 0);
    signal PC_out : STD_LOGIC_VECTOR (15 downto 0);

begin

mapping: pcAdder port map (PC_in, offset, PC_out);

    process
    begin
        PC_in <= X"0000";
        offset<= X"FF";
        wait for 10 ns;
        
        PC_in <= X"0001";
        wait for 10 ns;
    end process;

end Behavioral;
