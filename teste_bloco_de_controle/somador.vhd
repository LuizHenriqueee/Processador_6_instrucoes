library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity somador is 
	port(	a: in STD_LOGIC_VECTOR(15 downto 0);
			b: in STD_LOGIC_VECTOR(15 downto 0);
			s: out STD_LOGIC_VECTOR(15 downto 0));
end somador;

architecture asynth of somador is
signal b1: std_logic_vector(15 downto 0);
begin
	b1(7 downto 0) <= b(7 downto 0);
	b1(15 downto 8) <= (others => b(7));
	s<=std_logic_vector(signed(a)+signed(b1)- 1);
end;