----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 02:21:02 PM
-- Design Name: 
-- Module Name: memI - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.textio.ALL;
use ieee.std_logic_textio.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoryI is
    Port ( clk  : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (15 downto 0);
           rd : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (15 downto 0));
end memoryI;

architecture Behavioral of memoryI is

    type memI_type is array (2**16 - 1 downto 0) of STD_LOGIC_VECTOR (15 downto 0);
    signal memI : memI_type;
    

begin

    process
        file hex_File: text open read_mode is "hexFile.mem";
        variable index: integer;
        variable L : line;
        variable data_line : STD_LOGIC_VECTOR(15 downto 0);
        
        begin
        
        for i in 0 to 255 loop
            memI(i) <= X"0000";
        end loop;
        
        index:=0;
        
        while not endfile(hex_file) loop
            readline(hex_file, L);
            hread(L, data_line);
            memI(index) <= data_line;
            index := index + 1;
        end loop;
        wait;        
        end process;
        
        
        process(clk)
        begin
            if rising_edge(clk) then
                if rd = '1' then
                    data <= memI(conv_integer(addr));
                end if;
            end if;
        end process;


end Behavioral;
