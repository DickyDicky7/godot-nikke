class_name NikkeSubViewport; extends SubViewport; @export var spine_sprites_to_load: Array[SpineSprite];

func _ready() -> void:
    for spine_sprite: SpineSprite in spine_sprites_to_load:
        spine_sprite.call_deferred("reparent", self, true);
    pass;
