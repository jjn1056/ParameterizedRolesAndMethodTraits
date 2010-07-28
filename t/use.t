use strict; 
use warnings; 
use Test::More; 
 
use_ok 'MooseClass';
use_ok 'MooseXDeclareClass';
use_ok 'MyParameterizableRole';
use_ok 'MyDecoratedClass';
use_ok 'MyMethodTrait';
use_ok 'MyParameterizedAndTrait';
use_ok "HasLogging";
use_ok 'LoggedMethodsParameterizableRole';
use_ok "HasLoggingMethodTrait";
use_ok "LoggedMethodsMethodTrait"; 

done_testing; 
