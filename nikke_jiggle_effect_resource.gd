class_name NikkeJiggleEffectResource; extends Resource;

var tween_jiggle:                  Tween;
var         node: Node;
var         spine_bone_node     :  SpineBoneNode;
@export var spine_bone_node_path:       NodePath;
@export var offset_position_when_jiggle: Vector2;
@export var       tran_type_when_jiggle: Tween.TransitionType = Tween.TRANS_SINE;
@export var       ease_type_when_jiggle: Tween.      EaseType = Tween. EASE_OUT ;
@export var       _duration_when_jiggle: float = 0.2;

func init      ()    -> void      :
    spine_bone_node = node.get_node(spine_bone_node_path);
    spine_bone_node .                     bone_mode      =                      SpineConstant.BoneMode_Drive;
    pass;

func _do_jiggle()    -> void      :
    if (tween_jiggle != null
    &&  tween_jiggle.is_running()):
        return;
    var current_position: Vector2 = spine_bone_node.position;
    tween_jiggle =                             node.get_tree().create_tween();
    tween_jiggle.tween_property(spine_bone_node, "position",  current_position + offset_position_when_jiggle, _duration_when_jiggle).set_ease(ease_type_when_jiggle).set_trans(tran_type_when_jiggle);
    tween_jiggle.tween_property(spine_bone_node, "position",  current_position                              , _duration_when_jiggle).set_ease(ease_type_when_jiggle).set_trans(tran_type_when_jiggle);
    pass;
