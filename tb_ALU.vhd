----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 09:34:36
-- Design Name: 
-- Module Name: tb_ALU - Behavioral
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


entity tb_ALU is
--  Port ( );
end tb_ALU;

architecture Behavioral of tb_ALU is

    component ALU is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           alu_s1 : in STD_LOGIC;
           alu_s0 : in STD_LOGIC;
           alu_out : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal A,B: std_logic_vector(15 downto 0);
    signal alu_s1, alu_s0: std_logic;
    signal alu_out: std_logic_vector(15 downto 0);
    
begin
    utt: ALU Port map 
        ( A => A,
          B => B,
          alu_s1 => alu_s1,
          alu_s0 => alu_s0,
          alu_out => alu_out);
          
    stimulus: process
                begin      
                    -- passa A          
                    A <= "0000000000001100";-- 12
                    B <= "0000000000000010";-- 2
                    alu_s1 <= '0';
                    alu_s0 <= '0';
                    wait for 10ns;
                    -- soma sem carrier
                    A <= "0000000000001100";-- 12
                    B <= "0000000000000010";-- 2
                    alu_s1 <= '0';
                    alu_s0 <= '1';
                    wait for 20 ns;
                    -- sub sem sinal
                    A <= "0000000000001100";-- 12
                    B <= "0000000000000010";-- 2
                    alu_s1 <= '1';
                    alu_s0 <= '0';
                    wait for 30ns;
                    -- soma B com sinal
                    A <= "0000000000001100";-- 12
                    B <= "1111111111111110";-- 2
                    alu_s1 <= '0';
                    alu_s0 <= '1';
                    wait for 40ns;
                    -- sub com sinal
                    A <= "0000000000000010";-- 12
                    B <= "0000000000001100";-- 2
                    alu_s1 <= '1';
                    alu_s0 <= '0';
                    wait for 50ns;
              end process;
end Behavioral;
