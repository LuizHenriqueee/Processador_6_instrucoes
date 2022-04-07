----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 10:49:55 AM
-- Design Name: 
-- Module Name: programCounter - behavorial
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



-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity programCounter is
    Port ( clk : in STD_LOGIC;
           PC_ld : in STD_LOGIC;
           PC_clr : in STD_LOGIC;
           PC_inc : in STD_LOGIC;
           PC_in : in STD_LOGIC_VECTOR (15 downto 0);
           PC : out STD_LOGIC_VECTOR (15 downto 0));
end programCounter;

architecture behavorial of programCounter is

    signal PC_val: STD_LOGIC_VECTOR (15 downto 0) := X"0000";

begin   
-- Reset feito de maneira assincrona

    process(clk, PC_clr)
    begin
        if rising_edge(clk) then
            if PC_clr = '1' then
                PC_val <= X"0000";
            else
                if PC_ld = '1' then
                    PC_val <= PC_in;
                elsif PC_inc = '1' then 
                    PC_val <= PC_val + X"0001";     
                end if;
            end if;
         end if;
    end process;

    PC <= PC_val;

end behavorial;
