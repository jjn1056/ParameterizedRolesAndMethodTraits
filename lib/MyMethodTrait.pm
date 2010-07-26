use MooseX::Declare;
role MyMethodTrait {
    has tag => (is=>'ro', isa=>'Str', required=>1, default=>'div');
    around wrap(ClassName $class: $code, %options) {
        my $method_obj;
         $method_obj = $class->$orig(
             sub {
                my ($self, $arg) = @_;
                my $tag = $method_obj->tag;
                my $title = $self->$code($arg);
                return sprintf("<%s>%s</%s>", $tag, $title, $tag);
             }, %options,
         );
         return $method_obj
    }
}
