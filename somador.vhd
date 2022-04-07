use IEEE.STD_LOGIC_ARITH.all;
use IEEE.NUMERIC_STD.all;

entity somador is -- entradas e saída do bloco somador 
	port(	a: in STD_LOGIC_VECTOR(15 downto 0);
			b: in STD_LOGIC_VECTOR(7 downto 0);
			s: out STD_LOGIC_VECTOR(15 downto 0));
end somador;

architecture asynth of somador is
signal b1: signed(15 downto 0);-- sinal para ajustar o tamanho da palavra b 
begin
	b1<=b(7)&b;-- concatenando o b de 8 bits com o bit mais significativo para ter o tamanho 16 bits 
	s<=std_logic_vector((signed(a)+b1)-"0000000000000001"); -- operação de soma 'a' e 'b' com correção -1 
end;
