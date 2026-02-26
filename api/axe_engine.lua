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
local player_pawn = {}
---@return vec3
function player_pawn:get_eye_pos() end

---@class player_controller : entity
---@field is_local boolean
---@field steam_id string
---@field tick_base integer
---@field name string
---@field pawn player_pawn|nil
---@field observer_pawn player_pawn|nil
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
---@param flow integer
---@return number
function net_channel_info_t:get_avg_latency(flow) end
---@param flow integer
---@return number
function net_channel_info_t:get_avg_loss(flow) end
---@param flow integer
---@return number
function net_channel_info_t:get_avg_choke(flow) end
---@param flow integer
---@return number
function net_channel_info_t:get_avg_data(flow) end
---@param flow integer
---@return number
function net_channel_info_t:get_avg_packets(flow) end
---@param flow integer
---@return integer
function net_channel_info_t:get_total_data(flow) end
---@param flow integer
---@return integer
function net_channel_info_t:get_sequence_nr(flow) end
---@return boolean
function net_channel_info_t:is_loopback() end
---@return boolean
function net_channel_info_t:is_timing_out() end
---@return boolean
function net_channel_info_t:is_playback() end
---@return string
function net_channel_info_t:get_name() end
---@return string
function net_channel_info_t:get_address() end
---@return number
function net_channel_info_t:get_time() end
---@return number
function net_channel_info_t:get_time_connected() end
---@return integer
function net_channel_info_t:get_buffer_size() end
---@return integer
function net_channel_info_t:get_data_rate() end


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
---@return integer
function render.get_frame_count() end
---@return number
function render.get_delta_time() end
---@return number
function render.get_fps() end

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
function globals.absoluteframetime() end
---@return number
function globals.curtime() end
---@return number
function globals.frametime() end
---@return integer
function globals.max_clients() end
---@return integer
function globals.tickcount() end
---@return number
function globals.interval_per_tick() end


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
function entities.get_local_player() end
---@return player_pawn|nil
function entities.get_local_pawn() end
---@return player_controller|nil
function entities.get_local_controller() end
---@param index integer
---@return entity|nil
function entities.get_entity(index) end
---@param handle integer
---@return entity|nil
function entities.get_by_handle(handle) end
---@param enemies_only boolean
---@return player_pawn[]
function entities.get_players(enemies_only) end
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
---@return integer
function entities.get_local_pawn_ptr() end


Math = {}
---@param angles vec3
---@return vec3, vec3, vec3
function Math.angle_vectors(angles) end
---@param start_pos vec3
---@param end_pos vec3
---@return vec3
function Math.calc_angle(start_pos, end_pos) end
---@param angles vec3
---@return vec3
function Math.normalize_angle(angles) end
---@param angles vec3
function Math.clamp_angle(angles) end
---@param world_pos vec3
---@return boolean, number, number
function Math.world_to_screen(world_pos) end


utils = {}
---@param value string
---@return string
function utils.utf8_to_utf16(value) end
---@param value string
---@return string
function utils.utf16_to_utf8(value) end
---@param url string
---@return boolean
function utils.open_url(url) end
---@param text string
---@return boolean
function utils.set_clipboard(text) end
---@return string
function utils.get_clipboard() end
 


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
function zip_archive:list() end
---@param name string
---@param path string
function zip_archive:extract(name, path) end
---@param dir string
function zip_archive:extract_all(dir) end
function zip_archive:close() end

---@param path string
---@return zip_archive
function zip.open_file(path) end
---@param data table
---@return zip_archive
function zip.open_mem(data) end
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

---@class module_t
local module_t = {}
function module_t:retrieve() end
---@return integer
function module_t:base() end
---@param hash number
---@return integer
function module_t:get_interface(hash) end
---@param sig string
---@return integer
function module_t:scan_pattern(sig) end

---@param name string
---@return module_t
function module(name) end

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
---@return integer
function pointer_t:get_field_ptr(offset) end

---@param addr integer
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
---@return integer
function resource_system.get() end
---@param type string
---@return integer
function resource_system.make_tag(type) end



game = {}
---@return string
function game.get_game_dir() end

---@class trace_filter
local trace_filter = {}

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

defs = {
    hitbox = {
        head = 1,
        neck = 2,
        pelvis = 3,
        stomach = 4,
        chest = 5,
        lower_chest = 6,
        upper_chest = 7,
        right_thigh = 8,
        left_thigh = 9,
        right_calf = 10,
        left_calf = 11,
        right_foot = 12,
        left_foot = 13,
        right_hand = 14,
        left_hand = 15,
        right_upper_arm = 16,
        right_forearm = 17,
        left_upper_arm = 18,
        left_forearm = 19,
        max = 20
    },
    team = {
        unk = 0,
        spectator = 1,
        tt = 2,
        ct = 3
    },
    flags = {
        onground = 1,
        ducking = 2,
        animducking = 4,
        waterjump = 8,
        frozen = 16,
        atcontrols = 32,
        client = 64,
        fakeclient = 128
    },
    movetype = {
        none = 0,
        isometric = 1,
        walk = 2,
        step = 3,
        fly = 4,
        flygravity = 5,
        vphysics = 6,
        push = 7,
        noclip = 8,
        ladder = 9,
        observer = 10,
        custom = 11,
        last = 12,
        max_bits = 5
    },
    frame_stage = {
        undefined = -1,
        start = 0,
        render_start = 1,
        net_update_start = 2,
        net_update_preprocess = 3,
        net_pre_entity_packet = 4,
        net_update_postdataupdate_start = 5,
        net_update_postdataupdate_end = 6,
        net_update_end = 7,
        net_creation = 8,
        render_end = 9
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
        knife = 0, pistol = 1, smg = 2, rifle = 3, shotgun = 4, sniper_rifle = 5, mg = 6,
        c4 = 7, taser = 8, grenade = 9, equipment = 10, stackableitem = 11, fists = 12,
        breachcharge = 13, bumpmine = 14, tablet = 15, melee = 16, shield = 17, zone_repulsor = 18, unknown = 19
    },
    entity_type = {
        unknown = 0, player_controller = 1, player_pawn = 2, preview_player = 3, planted_c4 = 4,
        bomb = 5, projectile = 6, he_projectile = 7, smoke_projectile = 8, molotov_projectile = 9,
        weapon = 10, inferno = 11, sky = 12, world = 13, other = 14
    },
    item_index = {
        weapon_deagle = 1, weapon_elite = 2, weapon_fiveseven = 3, weapon_glock = 4, weapon_ak47 = 7, weapon_aug = 8,
        weapon_awp = 9, weapon_famas = 10, weapon_g3sg1 = 11, weapon_galilar = 13, weapon_m249 = 14, weapon_m4a1 = 16,
        weapon_mac10 = 17, weapon_p90 = 19, weapon_mp5sd = 23, weapon_ump45 = 24, weapon_xm1014 = 25, weapon_bizon = 26,
        weapon_mag7 = 27, weapon_negev = 28, weapon_sawedoff = 29, weapon_tec9 = 30, weapon_taser = 31, weapon_hkp2000 = 32,
        weapon_mp7 = 33, weapon_mp9 = 34, weapon_nova = 35, weapon_p250 = 36, weapon_shield = 37, weapon_scar20 = 38,
        weapon_sg553 = 39, weapon_ssg08 = 40, weapon_knife = 42, weapon_knife_t = 59, weapon_flashbang = 43, weapon_hegrenade = 44,
        weapon_smokegrenade = 45, weapon_molotov = 46, weapon_decoy = 47, weapon_incgrenade = 48, weapon_c4 = 49, weapon_healthshot = 57,
        weapon_m4a1_silencer = 60, weapon_usp_silencer = 61, weapon_cz75a = 63, weapon_revolver = 64
    }
}

---@param msg string
function log(msg) end

