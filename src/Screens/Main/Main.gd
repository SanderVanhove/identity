extends Node2D


### Automatic References Start ###
onready var _color_splitter: ColorRect = $BackBufferCopy/ColorSplitter
onready var _fractal: ColorRect = $BackBufferCopy2/Fractal
onready var _grid: ColorRect = $BackBufferCopy5/Grid
onready var _noise_train: ColorRect = $BackBufferCopy3/NoiseTrain
onready var _r_x_slider: HSlider = $VBoxContainer/RXSlider
### Automatic References Stop ###



func _on_RXSlider_value_changed(value):
	_color_splitter.material.set_shader_param("r_offset", Vector2(value, value))


func _on_GSlider_value_changed(value):
	_color_splitter.material.set_shader_param("g_offset", Vector2(pow(abs(value), 1.5), value))


func _on_BSlider_value_changed(value):
	_color_splitter.material.set_shader_param("b_offset", Vector2(value, 0))


func _on_ZXSlider_value_changed(value):
	var z = _fractal.material.get_shader_param("in_c_offset")
	_fractal.material.set_shader_param("in_c_offset", Vector2(value, z.y))


func _on_ZYSlider_value_changed(value):
	var z = _fractal.material.get_shader_param("in_c_offset")
	_fractal.material.set_shader_param("in_c_offset", Vector2(z.x, value))


func _on_NoiseTrainYSlider_value_changed(value):
	var offset = _noise_train.material.get_shader_param("offset")
	_noise_train.material.set_shader_param("offset", Vector2(offset.x, value))


func _on_NoiseTrainXSlider_value_changed(value):
	var offset = _noise_train.material.get_shader_param("offset")
	_noise_train.material.set_shader_param("offset", Vector2(value, offset.y))


func _on_CrossAngleSlider_value_changed(value):
	_grid.material.set_shader_param("offset_angle", value)
