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
use IEEE.NUMERIC_STD.ALL;
use STD.textio.ALL;
--use ieee.std_logic_textio.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoryI is
    Port ( addr : in STD_LOGIC_VECTOR (15 downto 0);
           rd : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (15 downto 0));
end memoryI;

architecture Behavioral of memoryI is

    type memI_type is array (2**8 - 1 downto 0) of STD_LOGIC_VECTOR (15 downto 0);
    signal memI : memI_type;
    signal test: integer;
    

begin

    mem_init:process
        file hex_File: text open read_mode is "hexFile.mem";
        variable index: integer;
        variable data_line : line;
        variable hex_val: integer;
        variable char: character;
        
        begin
        
        for i in 0 to 255 loop
            memI(i) <= X"0000";
        end loop;
        
        index:=0;
        
        while not endfile(hex_file) loop
            readline(hex_file, data_line);  
	    hex_val:=0;
            for k in 0 to 3 loop
                    read(data_line, char);
                    if char <= '9' and char >= '0' then
                        hex_val := hex_val*(16) + character'pos(char) - character'pos('0');
                    elsif char >= 'a' and char <= 'f' then
                        hex_val := hex_val*(16) + character'pos(char) - character'pos('a')+10;
                    elsif char>='A' and char <= 'F' then 
                        hex_val := hex_val*(16) + character'pos(char) - character'pos('A')+10;
                    end if;
            end loop;
            memI(index) <= STD_LOGIC_VECTOR(TO_UNSIGNED(hex_val, data'length));

            index := index + 1;
        end loop;
        wait;        
        end process;
        
     data_out:process(rd,addr)
     begin
        if rd='1' then 
        data <= memI(CONV_INTEGER(addr));
        end if;
     end process;
     
end Behavioral;
