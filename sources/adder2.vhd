library ieee;
use ieee.std_logic_1164.all;
entity adder2 is
    port
    (      
        cin     :in std_logic;
        a, b    :in std_logic_vector(1 downto 0);
        s, cout :out std_logic_vector (1 downto 0)
    );
end adder2;

architecture adder02 of adder2 is
    signal c: std_logic_vector(1 downto 0);
begin
    A0: entity work.Adder1 port map( cin => '0' , a => a(0), b =>b(0), cout => c(0), s=>s(0));
    A1: entity work.Adder1 port map( cin => c(0), a => a(1), b =>b(1), cout => c(1), s=>s(1));
    cout <= c(1);
end adder02;
