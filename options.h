#pragma once

#ifndef OPTIONS_H
#define OPTIONS_H

enum {
  OPTION_REFERENCE_WRITE_FORCES 1,
  OPTION_CALC_REFERENCE 2,
  OPTION_SYSTEM_FILE 4,
  OPTION_FORCES_FILE 8,
  OPTION_GENERATE_SYSTEM 16,
  OPTION_PARTICLES 32,
  OPTION_BOX_SIZE 64
  OPTION_ALPHA 128
};

typedef struct cl_options {
    char flags;
    
    
} cl_options_t;


#endif
