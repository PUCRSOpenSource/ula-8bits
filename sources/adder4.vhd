library ieee;
use ieee.std_logic_1164.all;
entity adder4 is
    port
    (      
        cin     :in std_logic,
        s, cout :out std_logic_vector (3 downto 0)
    );
end adder2;

architecture adder02 of adder2 is
    signal c: std_logic_vector(1 downto 0);
begin
    A0: entity work.Adder2 port map( cin => '0' , a => a(3 downto 2), b =>b(3 downto 2), cout => c(3 downto 2), s=>s(3 downto 2));
    A1: entity work.Adder2 port map( cin => '0' , a => a(1 downto 0), b =>b(1 downto 0), cout => c(1 downto 0), s=>s(1 downto 0));
    
    cout <= c(1);
end adder02;
