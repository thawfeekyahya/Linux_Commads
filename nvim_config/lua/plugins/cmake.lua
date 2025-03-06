return function() 
        -- CMake Setup
     require("cmake-tools").setup({
         cmake_command = "cmake",        -- CMake command
         cmake_build_directory = "build",  -- Output directory
         cmake_build_type = "Debug",     -- Default build type
         cmake_generate_options = { "-G", "Ninja" },  -- Use Ninja (remove for Make)
         cmake_regenerate_on_save = true,  -- Auto-regenerate on save
     })
end
