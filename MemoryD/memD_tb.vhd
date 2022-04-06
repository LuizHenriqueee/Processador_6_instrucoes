----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 10:05:23 AM
-- Design Name: 
-- Module Name: memD_tb - behavorial
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

entity memD_tb is
--  Port ( );
end memD_tb;

architecture behavorial of memD_tb is

component memD is
    Port ( clk : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (7 downto 0);
           D_rd : in STD_LOGIC;
           D_wr : in STD_LOGIC;
           W_data : in STD_LOGIC_VECTOR (15 downto 0);
           R_data : out STD_LOGIC_VECTOR (15 downto 0));
end component;

           signal sclk      : STD_LOGIC;
           signal saddr     : STD_LOGIC_VECTOR (7 downto 0);
           signal sD_rd     : STD_LOGIC;
           signal sD_wr     : STD_LOGIC;
           signal sW_data   : STD_LOGIC_VECTOR (15 downto 0);
           signal sR_data   : STD_LOGIC_VECTOR (15 downto 0);


begin

    memd_map: memd port map(sclk, saddr, sD_rd, sD_wr, sW_data, sR_data);
    
    clk_stim: process
    begin
        sclk <='0';
        wait for 5 ns;
        sclk <= '1';
        wait for 5 ns;
    end process;
    
    data_stim: process
    begin
    
    saddr <= X"00";
    sD_rd <= '0';
    sD_wr <= '1';
    sW_data <= X"00AA";
    
    wait for 10 ns;
    
    saddr <= X"FF";
    sW_data <= X"FFFF";
    
    wait for 10 ns;
    
    saddr <= X"00";
    sD_wr <= '0';
    sD_rd <= '1';
    
    wait for 10 ns;
    
    saddr <= X"FF";
    sD_rd <='1';
    
    wait for 10 ns;
    end process;
end behavorial;
