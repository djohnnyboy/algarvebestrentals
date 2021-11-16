<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class BlogTest extends TestCase
{
    /** @test */
    public function testIndex()
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }
}
