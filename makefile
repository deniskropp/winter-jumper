all: giana

INCLUDES += $(shell pkg-config --cflags sdl)
LIBS += $(shell pkg-config --libs sdl)

OBJECTS := \
	main.o animation.o check_collision_goodies.o check_collision_tiles.o check_collision_tiles_special.o \
	define_enemies.o define_giana.o define_goodies.o define_levels.o define_tiles.o draw_background.o \
	draw_enemies.o draw_giana.o draw_goodies.o draw_stats.o draw_text.o draw_tiles.o gameloops.o intro.o \
	jump.o load_level.o move_enemies.o SDL_initialize.o SDL_input.o SDL_surfaces.o draw_snow.o

giana: $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $+ $(LIBS)

%.o: Sources/%.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c -o $@ $<
