----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 12:45:14 PM
-- Design Name: 
-- Module Name: pcAdder - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pcAdder is
    Port ( PC_in : in STD_LOGIC_VECTOR (15 downto 0);
           offset : in STD_LOGIC_VECTOR (7 downto 0);
           PC_out : out STD_LOGIC_VECTOR (15 downto 0));
end pcAdder;

architecture Behavioral of pcAdder is

begin

PC_out <= PC_in + offset - X"0001";


end Behavioral;
