----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 11:09:29
-- Design Name: 
-- Module Name: tb_IR - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity tb_IR is
--  Port ( );
end tb_IR;

architecture Behavioral of tb_IR is
    
    component IR is
    Port ( data : in STD_LOGIC_VECTOR (15 downto 0);
           ld : in STD_LOGIC;
           clk: in std_logic;
           rst: in std_logic;
           IR_out : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal data, IR_out : std_logic_vector(15 downto 0);
    signal ld, clk, rst: std_logic := '0';
    constant period: time := 10ns;
    
begin
    
    utt: IR Port map 
         ( data => data,
           ld => ld,
           clk => clk,
           rst => rst,
           IR_out => IR_out);
    
    clk <= not clk after period/2;
    
    stimulus:process
                begin
                    rst <= '1';
                    wait for period;
                    rst <= '0';
                    ld <= '1';
                    data <= "0000000000000100";
                    wait for period;
                    rst <= '0';
                    ld <= '0';
                    wait for period;
                    rst <= '0';
                    ld <= '0';
                    data <= "0000000000000101";
                    wait for period;
                    rst <= '0';
                    ld <= '1';
                    data <= "0000000000000101";
                    wait for period;
                    ld <= '0';
                    wait;                 
             end process;

end Behavioral;
