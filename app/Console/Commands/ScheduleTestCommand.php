<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class ScheduleTestCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'test:schedule';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Test Schedule';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        logger(now());
        return 0;
    }
}
