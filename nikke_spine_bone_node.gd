class_name NikkeSpineBoneNode; extends SpineBoneNode;

@export var name_bone: String;

func      _ready() -> void:
#   super._ready()        ;
    self.bone_name =          name_bone          ;
    self.bone_mode = SpineConstant.BoneMode_Drive;
    pass;
