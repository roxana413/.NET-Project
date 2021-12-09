﻿using Application.DTO;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Users.Queries
{
    public class GetUserByName : IRequest<UserDTO>
    {
        public string? UserName { get; set; }
    }
}
