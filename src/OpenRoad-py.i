 /////////////////////////////////////////////////////////////////////////////
//
// BSD 3-Clause License
//
// Copyright (c) 2021, The Regents of the University of California
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
//
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// * Neither the name of the copyright holder nor the names of its
//   contributors may be used to endorse or promote products derived from
//   this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
///////////////////////////////////////////////////////////////////////////////

%include <std_string.i>
%include <std_vector.i>
%include <stdint.i>

%{

#include "odb/db.h"
#include "ord/Tech.h"
#include "ord/Design.h"

using odb::dbDatabase;
using odb::dbBlock;
using odb::dbTech;

// Defined by OpenRoad.i inlines
const char *
openroad_version();

const char *
openroad_git_describe();

odb::dbDatabase *
get_db();

odb::dbTech *
get_db_tech();

bool
db_has_tech();

odb::dbBlock *
get_db_block();

%}

%template(Corners) std::vector<sta::Corner*>;
%template(MTerms) std::vector<odb::dbMTerm*>;

%include "Exception-py.i"
%include "ord/Tech.h"
%include "ord/Design.h"

%newobject Design::getFloorplan();

const char *
openroad_version();

const char *
openroad_git_describe();

odb::dbDatabase *
get_db();

odb::dbTech *
get_db_tech();

bool
db_has_tech();

odb::dbBlock *
get_db_block();

%inline %{

namespace ord {
  void set_thread_count(int threads);
  int thread_count();
}

%}
