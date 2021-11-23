﻿using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Commands
{
    public class DeleteHouseCommand : IRequest<Guid>
    {
        public Guid Id { get; set; }
    }
}
