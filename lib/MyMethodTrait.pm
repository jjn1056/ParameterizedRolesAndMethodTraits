use MooseX::Declare;
role MyMethodTrait {
    has tag => (is=>'ro', isa=>'Str', required=>1, default=>'div');
    around wrap(ClassName $class: $code, %options) {
        my $replacement = sub {
            my ($method_obj, $self, $string) = @_;
            my $title = $self->$code($string);
            my $tag = $method_obj->tag;
            return "<$tag>$title</$tag>";
        };
        my $method_obj;
        $method_obj = $class->$orig(sub {$replacement->($method_obj,@_)}, %options);

        return $method_obj;
    }
}


