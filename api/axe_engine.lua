---@meta "axe_engine"

---@class vec2
---@field x number
---@field y number
local vec2 = {}
---@return number
function vec2:length() end

---@param x number
---@param y number
---@return vec2
function vec2(x, y) end


---@class vec3
---@field x number
---@field y number
---@field z number
local vec3 = {}
---@return number
function vec3:length() end
---@return number
function vec3:length_2d() end
---@param other vec3
---@return number
function vec3:dist_to(other) end
---@param other vec3
---@return number
function vec3:dot(other) end

---@param x number
---@param y number
---@param z number
---@return vec3
function vec3(x, y, z) end


---@class color
---@field r number
---@field g number
---@field b number
---@field a number
local color = {}
---@param hex number
---@return color
function color.from_hex(hex) end
---@param a color
---@param b color
---@param t number
---@return color
function color.lerp(a, b, t) end
---@param alpha number
---@return color
function color:with_alpha(alpha) end

---@param r number
---@param g number
---@param b number
---@param a? number
---@return color
function color(r, g, b, a) end


---@class game_trace
---@field entity entity|nil
---@field start_pos vec3
---@field end_pos vec3
---@field normal_pos vec3
---@field pos vec3
---@field fraction number
---@field ray_type integer
---@field all_solid boolean
---@field did_hit_world boolean
---@field is_visible boolean
local game_trace = {}
---@return integer
function game_trace:get_hitbox_id() end
---@return integer
function game_trace:get_hitgroup() end

---@class user_cmd
---@field sequence_number integer
---@field buttons integer

---@class game_event
---@field name string
local game_event = {}
---@return string
function game_event:get_name() end
---@param key string
---@param def? integer
---@return integer
function game_event:get_int(key, def) end
---@param key string
---@param def? number
---@return number
function game_event:get_float(key, def) end
---@param key string
---@param def? boolean
---@return boolean
function game_event:get_bool(key, def) end
---@param key string
---@return string
function game_event:get_string(key) end
---@param key string
---@return integer
function game_event:get_player_index(key) end
---@param key string
---@return player_controller
function game_event:get_player_controller(key) end
---@param key string
---@return player_pawn
function game_event:get_player_pawn(key) end

---@class handle
local handle = {}
---@return boolean
function handle:is_valid() end
---@return integer
function handle:entry_index() end
---@return integer
function handle:serial_number() end
---@return integer
function handle:to_int() end
---@return entity|nil
function handle:get() end

---@class entity
---@field index integer
---@field health integer
---@field team integer
---@field flags integer
---@field sim_time number
---@field velocity vec3
---@field handle handle
---@field origin vec3
---@field water_level number
---@field abs_velocity vec3
---@field move_type integer
---@field game_time number
---@field anim_time number
---@field view_offset vec3
---@field visible_in_pvs boolean
local entity = {}
---@return boolean
function entity:is_alive() end
---@return boolean
function entity:is_player_pawn() end
---@return boolean
function entity:is_player_controller() end
---@return boolean
function entity:is_weapon() end
---@return boolean
function entity:is_enemy() end
---@return boolean
function entity:is_breakable() end
---@return boolean
function entity:is_world() end
---@return boolean
function entity:is_sky() end
---@return boolean
function entity:is_preview() end
---@return boolean
function entity:is_inferno() end
---@return boolean
function entity:is_projectile() end
---@return boolean
function entity:is_he_projectile() end
---@return boolean
function entity:is_smoke_projectile() end
---@return boolean
function entity:is_molotov_projectile() end
---@return boolean
function entity:is_planted_c4() end
---@return boolean
function entity:is_bomb() end
---@return vec3
function entity:get_origin() end
---@return string
function entity:get_class_name() end

---@class player_pawn : entity
---@field armor integer
---@field is_scoped boolean
---@field is_defusing boolean
---@field has_defuser boolean
---@field has_helmet boolean
---@field eye_angles vec3
---@field controller player_controller|nil
---@field active_weapon weapon|nil
---@field weapons weapon[]
---@field observer_mode integer
---@field shots_fired integer
---@field flash_duration number
---@field flash_overlay_alpha number
---@field wait_for_no_attack boolean
---@field gun_game_immunity boolean
---@field is_grabbing_hostage boolean
---@field addon_bits integer
local player_pawn = {}
---@return vec3
function player_pawn:get_eye_pos() end
---@param bone_index integer
---@return vec3|nil
function player_pawn:get_bone_position(bone_index) end

---@class player_controller : entity
---@field is_local boolean
---@field steam_id string
---@field tick_base integer
---@field name string
---@field pawn player_pawn|nil
---@field observer_pawn player_pawn|nil
---@field ping integer
---@field controlling_bot boolean
---@field pawn_is_alive boolean
---@field comp_team_color integer
---@field music_kit_id integer
---@field music_kit_mvps integer
---@field mvps integer
local player_controller = {}

---@class weapon : entity
---@field in_reload boolean
---@field in_burst_mode boolean
---@field zoom_level integer
---@field weapon_state integer
---@field recoil_index number
---@field clip1 integer
---@field clip2 integer
---@field max_clip integer
---@field burst_shots_remaining integer
---@field postpone_fire_ready_ticks integer
---@field iron_sight_mode integer
---@field original_team_number integer
local weapon = {}
---@return boolean
function weapon:is_grenade() end
---@return boolean
function weapon:is_knife() end
---@return number
function weapon:get_inaccuracy() end
---@return number
function weapon:get_spread() end

---@class convar
---@field name string
local convar = {}
---@return number
function convar:get_float() end
---@return integer
function convar:get_int() end
---@return boolean
function convar:get_bool() end
---@return string
function convar:get_string() end
---@param value number
function convar:set_float(value) end
---@param value integer
function convar:set_int(value) end

---@class net_channel_info_t
local net_channel_info_t = {}
---@param flow integer
---@return number
function net_channel_info_t:get_latency(flow) end

---@class module_t
local module_t = {}
---@return boolean
function module_t:retrieve() end
---@return integer
function module_t:base() end
---@param hash number
---@return integer
function module_t:get_interface(hash) end
---@param name string
---@return integer
function module_t:get_proc_address(name) end
---@param name string
---@return integer
function module_t:get_export_address(name) end
---@param sig string
---@return integer
function module_t:scan_pattern(sig) end
---@return any
function module_t:handle() end
---@return string
function module_t:name() end

---@class pointer_t
local pointer_t = {}
---@return boolean
function pointer_t:is_valid() end
---@return any
function pointer_t:get() end
---@param offs integer
---@return pointer_t
function pointer_t:offset(offs) end
---@param a integer
---@param b integer
---@return pointer_t
function pointer_t:absolute(a, b) end
---@param count integer
---@return pointer_t
function pointer_t:dereference(count) end
---@param offset integer
---@return pointer_t
function pointer_t:get_field_ptr(offset) end

---@class zip_archive
local zip_archive = {}
---@param name string
---@return string
function zip_archive:read(name) end
---@param name string
---@return table
function zip_archive:read_stream(name) end
---@param name string
---@param data string
function zip_archive:write(name, data) end
---@param name string
---@param data table
function zip_archive:write_stream(name, data) end
---@param path string
function zip_archive:save(path) end
---@param name string
---@return boolean
function zip_archive:exists(name) end
---@return table
function zip_archive:get_files() end
---@param name string
---@param path string
function zip_archive:extract(name, path) end
---@param dir string
function zip_archive:extract_all(dir) end
function zip_archive:close() end

---@class trace_filter
local trace_filter = {}

---@class ui_panel
local ui_panel = {}
---@return boolean
function ui_panel:is_valid() end
---@return string
function ui_panel:get_id() end
---@return table
function ui_panel:get_children() end
---@param id string
---@return ui_panel|nil
function ui_panel:find_child(id) end
---@param max_depth? integer
---@return string
function ui_panel:dump_tree(max_depth) end
---@param script string
function ui_panel:run_script(script) end
---@param event string
function ui_panel:dispatch_event(event, ...) end
---@param visible boolean
function ui_panel:set_visible(visible) end
function ui_panel:delete() end

---@class resource_system_iface
local resource_system_iface = {}
---@param hash integer
---@return string
function resource_system_iface:find_or_register_by_hash(hash) end
---@param name string
---@param extension integer
---@return boolean
function resource_system_iface:load_resource(name, extension) end
---@param name string
---@param extension integer
---@return boolean
function resource_system_iface:pre_cache(name, extension) end

---@class lag_record
---@field origin vec3
---@field abs_origin vec3
---@field velocity vec3
---@field eye_angles vec3
---@field simulation_time number
---@field choked_ticks integer
---@field valid boolean
---@field immune boolean
local lag_record = {}
---@param bone_idx integer
---@return vec3|nil
function lag_record:get_bone_pos(bone_idx) end


events = {}
---@param name string
---@param callback function
---@param filters? table
---@return integer
function events.register(name, callback, filters) end
---@param name string
---@param callback function
function events.unregister(name, callback) end
---@param name string
function events.clear(name) end


render = {}
---@param x number
---@param y number
---@param w number
---@param h number
---@param col color
---@param rounding? number
function render.rect(x, y, w, h, col, rounding) end
---@param x number
---@param y number
---@param w number
---@param h number
---@param col color
---@param rounding? number
function render.filled_rect(x, y, w, h, col, rounding) end
---@param x number
---@param y number
---@param w number
---@param h number
---@param col1 color
---@param col2 color
---@param type integer
function render.filled_rect_gradient(x, y, w, h, col1, col2, type) end
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param col color
---@param thickness? number
function render.line(x1, y1, x2, y2, col, thickness) end
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param col1 color
---@param col2 color
---@param thickness? number
function render.line_gradient(x1, y1, x2, y2, col1, col2, thickness) end
---@param x number
---@param y number
---@param radius number
---@param col color
---@param segments? integer
function render.circle(x, y, radius, col, segments) end
---@param x number
---@param y number
---@param radius number
---@param col color
---@param segments? integer
function render.filled_circle(x, y, radius, col, segments) end
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
---@param col color
---@param thickness? number
function render.triangle(x1, y1, x2, y2, x3, y3, col, thickness) end
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
---@param col color
function render.filled_triangle(x1, y1, x2, y2, x3, y3, col) end
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param col color
---@param thickness? number
---@param arrow_size? number
function render.arrow(x1, y1, x2, y2, col, thickness, arrow_size) end
---@param x number
---@param y number
---@param radius number
---@param min_angle number
---@param max_angle number
---@param col color
---@param thickness? number
---@param segments? integer
function render.arc(x, y, radius, min_angle, max_angle, col, thickness, segments) end
---@param x number
---@param y number
---@param radius number
---@param inner color
---@param outer color
---@param intensity? number
function render.glow_circle(x, y, radius, inner, outer, intensity) end
---@param x number
---@param y number
---@param w number
---@param h number
---@param col color
---@param rounding number
---@param shadow_size? number
---@param shadow_color? color
function render.rounded_rect_shadow(x, y, w, h, col, rounding, shadow_size, shadow_color) end
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param col color
---@param thickness? number
---@param dash_len? number
---@param gap_len? number
function render.dashed_line(x1, y1, x2, y2, col, thickness, dash_len, gap_len) end
---@param x number
---@param y number
---@param z number
---@param radius integer
---@param points integer
---@param col1 color
---@param col2 color
---@param thickness number
---@param progress? number
function render.world_ring(x, y, z, radius, points, col1, col2, thickness, progress) end
---@param x number
---@param y number
---@param w number
---@param h number
---@param intersect? boolean
function render.push_clip_rect(x, y, w, h, intersect) end
function render.pop_clip_rect() end
---@param name string
---@param priority? integer
function render.begin_layer(name, priority) end
function render.end_layer() end
---@param texture any
---@param x number
---@param y number
---@param w number
---@param h number
---@param col? color
---@return boolean
function render.image(texture, x, y, w, h, col) end
---@param texture any
---@param x number
---@param y number
---@param w number
---@param h number
---@param u0 number
---@param v0 number
---@param u1 number
---@param v1 number
---@param col? color
---@return boolean
function render.image_uv(texture, x, y, w, h, u0, v0, u1, v1, col) end
---@param name string
---@param path string
---@return boolean
function render.load_texture(name, path) end
---@param name string
---@param path string
---@param w number
---@param h number
---@return boolean
function render.load_svg(name, path, w, h) end
---@param name string
---@return any|nil
function render.get_texture(name) end
---@param name string
---@param path string
---@param size number
---@return boolean
function render.add_font(name, path, size) end
---@return table
function render.list_fonts() end
---@param name string
---@param path string
---@return boolean
function render.load_gif(name, path) end
---@param name string
---@return number, number, number, number
function render.get_gif_info(name) end
---@param name string
---@param idx integer
---@return any, number, number
function render.get_gif_frame(name, idx) end
---@param x number
---@param y number
---@param text string
---@param col color
---@param font_flags integer
---@param font_name? string
---@param font_size? number
function render.text(x, y, text, col, font_flags, font_name, font_size) end
---@param text string
---@param font_name? string
---@param font_size? number
---@return number, number
function render.text_size(text, font_name, font_size) end
---@param id string
---@param x number
---@param y number
---@param w number
---@param h number
---@param button? integer
---@return number, number, boolean, boolean
function render.drag_rect(id, x, y, w, h, button) end
---@param x number
---@param y number
---@param w number
---@param h number
---@return boolean
function render.is_rect_visible(x, y, w, h) end
---@return number, number
function render.get_screen_size() end
---@return number, number
function render.get_mouse_pos() end
---@return number, number
function render.get_mouse_delta() end
---@return number
function render.get_mouse_wheel() end
---@param button integer
---@return boolean
function render.is_mouse_down(button) end
---@param button integer
---@return boolean
function render.is_mouse_clicked(button) end
---@param button integer
---@return boolean
function render.is_mouse_released(button) end
---@param btn integer
---@param threshold? number
---@return boolean
function render.is_mouse_dragging(btn, threshold) end
---@return integer
function render.get_frame_count() end
---@return number
function render.get_delta_time() end
---@return number
function render.get_fps() end


ui = {}
---@param callback function
---@param tab? string
function ui.register(callback, tab) end
---@param id string
---@param active boolean
---@return boolean
function ui.check_box(id, active) end
---@param id string
---@param value number
---@param min number
---@param max number
---@param format? string
---@return number
function ui.slider_float(id, value, min, max, format) end
---@param id string
---@param value integer
---@param min integer
---@param max integer
---@param format? string
---@return integer
function ui.slider_int(id, value, min, max, format) end
---@param id string
---@param selected integer
---@param items table
---@return integer
function ui.combo(id, selected, items) end
---@param id string
---@param selected integer
---@param items table
---@return integer
function ui.multi_combo(id, selected, items) end
---@param id string
---@param color color
---@param flags? integer
---@return color
function ui.color_edit(id, color, flags) end
---@param label string
---@param size_x? number
---@param size_y? number
---@return boolean
function ui.button(label, size_x, size_y) end
---@param label string
---@param active boolean
---@param size_x? number
---@param size_y? number
---@return boolean
function ui.toggle_button(label, active, size_x, size_y) end
---@param id string
---@param value string
---@param max_length integer
---@return string
function ui.input_text(id, value, max_length) end
---@param id string
---@param value integer
---@return integer
function ui.key_bind(id, value) end


input = {}
---@param vk integer
---@return boolean
function input.is_key_down(vk) end
---@param vk integer
---@return boolean
function input.is_key_pressed(vk) end
---@return number, number
function input.get_cursor_pos() end
---@return vec3
function input.get_view_angle() end
---@param angles vec3
function input.set_view_angle(angles) end
---@return user_cmd
function input.get_user_cmd() end
---@return boolean
function input.is_third_person() end
---@return boolean
function input.is_in_attack() end


engine = {}
---@return boolean
function engine.is_in_game() end
---@return boolean
function engine.is_connected() end
---@return string
function engine.get_level_name() end
---@return string
function engine.get_short_level_name() end
---@return number, number
function engine.get_screen_size() end
---@return integer
function engine.get_local_player() end
---@param cmd string
function engine.execute_client_cmd(cmd) end
---@param w number
---@param h number
---@return number
function engine.get_aspect_ratio(w, h) end
---@return integer
function engine.get_product_version_int() end
---@return integer
function engine.get_build_version() end
---@return string
function engine.get_product_build_date() end
---@return string
function engine.get_version_time() end
---@return integer
function engine.get_signon_state() end
---@return net_channel_info_t
function engine.get_net_channel_info() end


cvar = {}
---@param name string
---@return convar|nil
function cvar.find(name) end


globals = {}
---@return number
function globals.realtime() end
---@return integer
function globals.framecount() end
---@return number
function globals.curtime() end
---@return number
function globals.frametime() end
---@return integer
function globals.maxclients() end
---@return integer
function globals.tickcount() end
---@return string
function globals.mapname() end
---@return string
function globals.cheat_version() end
---@return string
function globals.game_version() end
---@return string
function globals.user_name() end
---@return integer
function globals.avatar() end


game_rules = {}
---@return boolean
function game_rules.freeze_period() end
---@return boolean
function game_rules.warmup_period() end
---@return boolean
function game_rules.has_match_started() end
---@return boolean
function game_rules.bomb_planted() end
---@return boolean
function game_rules.bomb_dropped() end
---@return boolean
function game_rules.valve_dedicated() end
---@return boolean
function game_rules.is_round_live() end
---@return integer
function game_rules.game_phase() end
---@return integer
function game_rules.round_number() end
---@return integer
function game_rules.round_win_status() end
---@return integer
function game_rules.round_win_reason() end
---@return integer
function game_rules.total_rounds_played() end
---@return number
function game_rules.warmup_period_end() end
---@return number
function game_rules.match_start_time() end
---@return number
function game_rules.round_start_time() end


prediction = {}
---@return boolean
function prediction.in_prediction() end
---@return boolean
function prediction.first_time() end
---@return boolean
function prediction.engine_paused() end
---@return integer
function prediction.delta_tick() end


network_client = {}
---@return number
function network_client.interpolation() end
---@return boolean
function network_client.should_predict() end
---@return integer
function network_client.delta_tick() end


entities = {}
---@return player_pawn|nil
function entities.get_local_pawn() end
---@return player_controller|nil
function entities.get_local_controller() end
---@return integer
function entities.get_local_pawn_ptr() end
---@param index integer
---@return entity|nil
function entities.get_entity(index) end
---@param handle integer
---@return entity|nil
function entities.get_by_handle(handle) end
---@param enemies_only boolean
---@return player_pawn[]
function entities.get_players(enemies_only) end
---@param enemies_only boolean
---@return player_pawn[]
function entities.players(enemies_only) end
---@return player_controller[]
function entities.controllers() end
---@param type integer
---@return entity[]
function entities.get_by_type(type) end
---@return entity[]
function entities.get_all() end
---@param obj any
---@return integer
function entities.to_ptr(obj) end


math.world_to_screen = function(world_pos) end
---@param world_pos vec3
---@return vec2|nil
math.world_to_screen = function(world_pos) end
---@param yaw number
---@return number
math.normalize_yaw = function(yaw) end
---@param angles vec3
---@return vec3
math.normalize = function(angles) end
---@param angles vec3
---@return vec3
math.normalize_angles = function(angles) end
---@param angles vec3
---@return vec3
math.clamp_angles = function(angles) end
---@param angle vec3
---@return vec3
math.from_angle = function(angle) end
---@param src vec3
---@param dst vec3
---@return vec3
math.calc_angle = function(src, dst) end
---@param view_angle vec3
---@param aim_angle vec3
---@return number
math.get_fov = function(view_angle, aim_angle) end
---@param s1 vec3
---@param s2 vec3
---@param k1 vec3
---@param k2 vec3
---@return number
math.segment_to_segment = function(s1, s2, k1, k2) end
---@param s1 vec3
---@param s2 vec3
---@param mn vec3
---@param mx vec3
---@return boolean
math.intersect_line_with_bb = function(s1, s2, mn, mx) end
---@param forward vec3
---@return vec3
math.vector_angles = function(forward) end
---@param angles vec3
---@return vec3
math.angle_vectors = function(angles) end
---@param angles vec3
---@return vec3, vec3, vec3
math.angle_vectors_full = function(angles) end
---@param a number
---@return number, number
math.sincos = function(a) end


utils = {}
---@param value number
---@param min number
---@param max number
---@return number
function utils.clamp(value, min, max) end
---@param from number
---@param to number
---@param t number
---@return number
function utils.lerp(from, to, t) end
---@param value number
---@param in_min number
---@param in_max number
---@param out_min number
---@param out_max number
---@return number
function utils.remap(value, in_min, in_max, out_min, out_max) end
---@param current number
---@param target number
---@param delta number
---@return number
function utils.approach(current, target, delta) end
---@param min integer
---@param max integer
---@return integer
function utils.random_int(min, max) end
---@param min number
---@param max number
---@return number
function utils.random_float(min, max) end
---@return integer
function utils.flags(...) end
---@return table
function utils.get_time() end
---@return boolean
function utils.print_console(...) end
---@param col color
---@return boolean
function utils.print_console_colored(col, ...) end


hash = {}
---@param value string
---@return integer
function hash.fnv1a(value) end
---@param value string
---@return integer
function hash.murmur(value) end


http = {}
---@param url string
---@param headers? table
---@return table
function http.get(url, headers) end
---@param url string
---@param body string
---@param headers? table
---@return table
function http.post(url, body, headers) end
---@param url string
---@param callback function
---@param headers? table
function http.get_async(url, callback, headers) end
---@param url string
---@param body string
---@param callback function
---@param headers? table
function http.post_async(url, body, callback, headers) end

sound = {}
---@param path string
---@param volume? number
---@return boolean
function sound.play(path, volume) end

base64 = {}
---@param data string
---@return string
function base64.encode(data) end
---@param data string
---@return string
function base64.decode(data) end

fs = {}
---@param path string
---@return string
function fs.read(path) end
---@param path string
---@return table
function fs.read_stream(path) end
---@param path string
---@param data string
function fs.write(path, data) end
---@param path string
---@param data table
function fs.write_stream(path, data) end
---@param path string
function fs.remove(path) end
---@param path string
---@return boolean
function fs.exists(path) end
---@param path string
---@return boolean
function fs.is_file(path) end
---@param path string
---@return boolean
function fs.is_dir(path) end
---@param path string
function fs.create_dir(path) end

resources = {}
---@param relative string
---@return string
function resources.path(relative) end
---@param relative string
---@return string
function resources.read(relative) end
---@param relative string
---@return table
function resources.read_bytes(relative) end
---@param relative string
---@return integer
function resources.size(relative) end
---@param relative string
---@return boolean
function resources.exists(relative) end
---@param relative? string
---@return table
function resources.list(relative) end

zip = {}
---@param path string
---@return zip_archive
function zip.open(path) end
---@param data table
---@return zip_archive
function zip.open_stream(data) end
---@return zip_archive
function zip.create() end

localize = {}
---@param token string
---@return string
function localize.find(token) end

game_ui = {}
---@return boolean
function game_ui.is_available() end
---@param title string
---@param message string
---@param show_ok? boolean
---@param show_cancel? boolean
---@param ok_cmd? string
---@param cancel_cmd? string
function game_ui.show_message(title, message, show_ok, show_cancel, ok_cmd, cancel_cmd) end

scripts = {}
---@return table
function scripts.get_all() end
---@return table
function scripts.get_loaded() end
---@param name string
---@return boolean
function scripts.is_loaded(name) end
---@param name string
---@return boolean
function scripts.load(name) end
---@param name string
function scripts.unload(name) end
function scripts.reload_all() end
---@return string
function scripts.get_active() end
---@param name string
function scripts.set_active(name) end

config = {}
---@param path string
---@return boolean
function config.exists(path) end
---@param prefix? string
---@return table
function config.list_paths(prefix) end
---@param path string
---@param default? boolean
---@return boolean
function config.get_bool(path, default) end
---@param path string
---@param default? integer
---@return integer
function config.get_int(path, default) end
---@param path string
---@param default? number
---@return number
function config.get_float(path, default) end
---@param path string
---@param value boolean
---@return boolean
function config.set_bool(path, value) end
---@param path string
---@param value integer
---@return boolean
function config.set_int(path, value) end
---@param path string
---@param value number
---@return boolean
function config.set_float(path, value) end
---@return table
function config.get_keybinds() end

---@param name string
---@return module_t
function module(name) end

---@return pointer_t
function pointer(...) end

schema = {}
---@param dll string
---@param class string
---@param field string
---@return integer
function schema.get_offset(dll, class, field) end

resource_system = {}
---@return boolean
function resource_system.is_allowed() end
---@return resource_system_iface
function resource_system.get() end
---@param type string
---@return integer
function resource_system.make_tag(type) end

game = {}
---@return string
function game.get_game_dir() end

trace = {}
---@param ray ray
---@param start_pos vec3
---@param end_pos vec3
---@param filter trace_filter
---@param out_trace game_trace
---@return boolean
function trace.trace_shape(ray, start_pos, end_pos, filter, out_trace) end
---@param ray ray
---@param start_pos vec3
---@param end_pos vec3
---@param ent entity
---@param filter trace_filter
---@param out_trace game_trace
---@return boolean
function trace.clip_ray_to_entity(ray, start_pos, end_pos, ent, filter, out_trace) end

lagcomp = {}
---@param pawn player_pawn
---@return lag_record[]
function lagcomp.get_records(pawn) end

panorama = {}
---@return boolean
function panorama.is_available() end
---@return ui_panel|nil
function panorama.get_root() end
---@return ui_panel|nil
function panorama.get_main_menu() end
---@param script string
---@return boolean
function panorama.run_script(script) end
---@param event string
---@return boolean
function panorama.dispatch_event(event, ...) end

signon_state = {
    none = 0,
    challenge = 1,
    connected = 2,
    new = 3,
    prespawn = 4,
    spawn = 5,
    full = 6,
    changelevel = 7
}

flow = {
    outgoing = 0,
    incoming = 1
}

defs = {
    hitbox = {
        head = 0,
        neck = 1,
        pelvis = 2,
        stomach = 3,
        chest = 4,
        lower_chest = 5,
        upper_chest = 6,
        right_thigh = 7,
        left_thigh = 8,
        right_calf = 9,
        left_calf = 10,
        right_foot = 11,
        left_foot = 12,
        right_hand = 13,
        left_hand = 14,
        right_upper_arm = 15,
        right_forearm = 16,
        left_upper_arm = 17,
        left_forearm = 18,
        max = 19
    },
    team = {
        spectator = 1,
        tt = 2,
        ct = 3
    },
    flags = {
        onground = 1,
        ducking = 2,
        animducking = 4,
        waterjump = 8,
        frozen = 32,
        atcontrols = 64,
        client = 128,
        fakeclient = 256
    },
    movetype = {
        none = 0,
        walk = 2,
        fly = 3,
        flygravity = 4,
        vphysics = 5,
        push = 6,
        noclip = 7,
        observer = 8,
        ladder = 9,
        custom = 10,
        last = 11,
        max_bits = 5
    },
    frame_stage = {
        start = 0,
        net_update_start = 1,
        net_update_postdataupdate_start = 2,
        net_update_postdataupdate_end = 3,
        net_update_end = 4,
        render_start = 5,
        render_end = 6,
        snet_full_update_start = 7,
        snet_full_update_end = 8,
        restore_server_state = 10
    },
    observer_mode = {
        none = 0,
        fixed = 1,
        in_eye = 2,
        chase = 3,
        roaming = 4,
        num_modes = 5
    },
    weapon_type = {
        knife = 0, pistol = 1, smg = 2, rifle = 3, shotgun = 4, sniper_rifle = 5,
        mg = 6, c4 = 7, taser = 8, grenade = 9, equipment = 10, stackableitem = 11, unknown = 12
    },
    entity_type = {
        unknown = 0, player_controller = 1, player_pawn = 2, preview_player = 3, planted_c4 = 4,
        bomb = 5, projectile = 6, he_projectile = 7, smoke_projectile = 8, molotov_projectile = 9,
        weapon = 10, inferno = 11, sky = 12, world = 13, other = 14
    },
    item_index = {
        weapon_none = 0,
        weapon_deagle = 1, weapon_elite = 2, weapon_fiveseven = 3, weapon_glock = 4,
        weapon_ak47 = 7, weapon_aug = 8, weapon_awp = 9, weapon_famas = 10, weapon_g3sg1 = 11,
        weapon_galilar = 13, weapon_m249 = 14, weapon_m4a1 = 16, weapon_mac10 = 17,
        weapon_p90 = 19, weapon_zone_repulsor = 20, weapon_mp5sd = 23, weapon_ump45 = 24,
        weapon_xm1014 = 25, weapon_bizon = 26, weapon_mag7 = 27, weapon_negev = 28,
        weapon_sawedoff = 29, weapon_tec9 = 30, weapon_taser = 31, weapon_hkp2000 = 32,
        weapon_mp7 = 33, weapon_mp9 = 34, weapon_nova = 35, weapon_p250 = 36,
        weapon_shield = 37, weapon_scar20 = 38, weapon_sg553 = 39, weapon_ssg08 = 40,
        weapon_knifegg = 41, weapon_knife = 42, weapon_flashbang = 43, weapon_hegrenade = 44,
        weapon_smokegrenade = 45, weapon_molotov = 46, weapon_decoy = 47, weapon_incgrenade = 48,
        weapon_c4 = 49, weapon_healthshot = 57, weapon_knife_t = 59, weapon_m4a1_silencer = 60,
        weapon_usp_silencer = 61, weapon_cz75a = 63, weapon_revolver = 64,
        weapon_tagrenade = 68, weapon_fists = 69, weapon_breachcharge = 70,
        weapon_tablet = 72, weapon_melee = 74, weapon_axe = 75, weapon_hammer = 76,
        weapon_spanner = 78, weapon_knife_ghost = 80, weapon_firebomb = 81,
        weapon_diversion = 82, weapon_frag_grenade = 83, weapon_snowball = 84,
        weapon_bumpmine = 85,
        weapon_knife_bayonet = 500, weapon_knife_css = 503, weapon_knife_flip = 505,
        weapon_knife_gut = 506, weapon_knife_karambit = 507, weapon_knife_m9_bayonet = 508,
        weapon_knife_tactical = 509, weapon_knife_falchion = 512,
        weapon_knife_survival_bowie = 514, weapon_knife_butterfly = 515,
        weapon_knife_push = 516, weapon_knife_cord = 517, weapon_knife_canis = 518,
        weapon_knife_ursus = 519, weapon_knife_gypsy_jackknife = 520,
        weapon_knife_outdoor = 521, weapon_knife_stiletto = 522,
        weapon_knife_widowmaker = 523, weapon_knife_skeleton = 525,
        glove_studded_bloodhound = 5027, glove_t_side = 5028, glove_ct_side = 5029,
        glove_sporty = 5030, glove_slick = 5031, glove_leather_wrap = 5032,
        glove_motorcycle = 5033, glove_specialist = 5034, glove_hydra = 5035
    },
    bone = {
        pelvis = 1,
        spine_2 = 3,
        spine_1 = 4,
        neck_0 = 6,
        head = 7,
        arm_upper_l = 9,
        arm_lower_l = 10,
        hand_l = 11,
        arm_upper_r = 13,
        arm_lower_r = 14,
        hand_r = 15,
        leg_upper_l = 17,
        leg_lower_l = 18,
        ankle_l = 19,
        leg_upper_r = 20,
        leg_lower_r = 21,
        ankle_r = 22
    },
    hitgroup = {
        generic = 0,
        head = 1,
        chest = 2,
        stomach = 3,
        left_arm = 4,
        right_arm = 5,
        left_leg = 6,
        right_leg = 7,
        neck = 8,
        gear = 10
    },
    contents = {
        empty = 0,
        solid = 0x1,
        window = 0x2,
        aux = 0x4,
        grate = 0x8,
        slime = 0x10,
        water = 0x20,
        blocklos = 0x40,
        opaque = 0x80,
        testfogvolume = 0x100,
        unused = 0x200,
        blocklight = 0x400,
        team1 = 0x800,
        team2 = 0x1000,
        ignore_nodraw_opaque = 0x2000,
        moveable = 0x4000,
        areaportal = 0x8000,
        playerclip = 0x10000,
        monsterclip = 0x20000,
        current_0 = 0x40000,
        current_90 = 0x80000,
        current_180 = 0x100000,
        current_270 = 0x200000,
        current_up = 0x400000,
        current_down = 0x800000,
        origin = 0x1000000,
        monster = 0x2000000,
        debris = 0x4000000,
        detail = 0x8000000,
        translucent = 0x10000000,
        ladder = 0x20000000,
        hitbox = 0x40000000
    },
    mask = {
        all = 0xffffffff,
        solid = 0x200b,
        playersolid = 0x1201b,
        npcsolid = 0x2000b,
        npcfluid = 0x2000b,
        water = 0x4030,
        opaque = 0x4081,
        opaque_and_npcs = 0x6081,
        blocklos = 0x400c1,
        blocklos_and_npcs = 0x402c1,
        visible = 0x6081,
        visible_and_npcs = 0x8081,
        shot = 0x4600b,
        shot_brushonly = 0x4003,
        shot_hull = 0x4600b,
        shot_portal = 0x200b,
        solid_brushonly = 0x200b,
        playersolid_brushonly = 0x1000b,
        npcsolid_brushonly = 0x2000b,
        npcworldstatic = 0x20003,
        npcworldstatic_fluid = 0x20003,
        splitareportal = 0x30,
        current = 0xfc0000,
        deadsolid = 0x10019
    },
    ray_type = {
        line = 0,
        sphere = 1,
        hull = 2,
        capsule = 3,
        mesh = 4
    },
    buttons = {
        attack = 1,
        jump = 2,
        duck = 4,
        forward = 8,
        back = 16,
        use = 32,
        cancel = 64,
        left = 128,
        right = 256,
        move_left = 512,
        move_right = 1024,
        second_attack = 2048,
        run = 4096,
        reload = 8192,
        left_alt = 16384,
        right_alt = 32768,
        score = 65536,
        speed = 131072,
        walk = 262144,
        zoom = 524288,
        first_weapon = 1048576,
        second_weapon = 2097152,
        bullrush = 4194304,
        first_grenade = 8388608,
        second_grenade = 16777216,
        middle_attack = 33554432,
        use_or_reload = 67108864
    },
    button_state = {
        up = 0,
        down = 1,
        down_up = 2,
        up_down = 3,
        up_down_up = 4,
        down_up_down = 5,
        down_up_down_up = 6,
        up_down_up_down = 7
    },
    cvar_flags = {
        none = 0,
        unregistered = 1,
        development_only = 2,
        game_dll = 4,
        client_dll = 8,
        hidden = 16,
        protected = 32,
        sp_only = 64,
        archive = 128,
        notify = 256,
        user_info = 512,
        printable_only = 1024,
        unlogged = 2048,
        never_as_string = 4096,
        replicated = 8192,
        cheat = 16384,
        demo = 65536,
        dont_record = 131072,
        reload_materials = 1048576,
        reload_textures = 2097152,
        not_connected = 4194304,
        material_system_thread = 8388608,
        archive_xbox = 16777216,
        accessible_from_threads = 33554432,
        server_can_execute = 268435456,
        server_cannot_query = 536870912,
        clientcmd_can_execute = 1073741824,
        material_thread_mask = 11534336
    },
    flow = {
        outgoing = 0,
        incoming = 1
    }
}

---@param msg string
function log(msg) end
