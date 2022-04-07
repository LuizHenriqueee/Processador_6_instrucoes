----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 10:53:49
-- Design Name: 
-- Module Name: IR - Behavioral
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

entity IR is
    Port ( data : in STD_LOGIC_VECTOR (15 downto 0);
           ld : in STD_LOGIC;
           clk: in std_logic;
           rst: in std_logic;
           IR_out : out STD_LOGIC_VECTOR (15 downto 0));
end IR;

architecture Behavioral of IR is

    signal data_prev: std_logic_vector(15 downto 0);
    
begin
    process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    IR_out <= (others => '0');
                else
                    if ld = '1' then
                         IR_out <= data;
                         data_prev <= data;
                    else
                         IR_out <= data_prev;
                    end if;
                end if;
            end if;
    end process;
end Behavioral;
