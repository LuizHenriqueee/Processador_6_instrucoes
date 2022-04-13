library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity somador is 
	port(	a: in STD_LOGIC_VECTOR(15 downto 0);
			b: in STD_LOGIC_VECTOR(7 downto 0);
			s: out STD_LOGIC_VECTOR(15 downto 0));
end somador;

architecture asynth of somador is
    signal sum : unsigned(15 downto 0);
begin
	--Realiza a soma utilizando dois unsigned.
	sum<=unsigned(a)+unsigned(b);
	--Atribuí como sendo um standard logic vector.
	s <= STD_LOGIC_VECTOR(sum - X"0001");
end;
