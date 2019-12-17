<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class QuizSummaryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'topic_id' => 'required|exists:topics,id',
            'title' => 'required|unique:quiz_summary,title,'.$this->topic_id.',topic_id,deleted_at,NULL',
            'description' => 'required',
            'duration_seconds' => 'required|integer'
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'The title field is required',
            'description.required'  => 'The description field is required',
            'duration_seconds.required'  => 'The Duration Seconds field is required',
        ];
    }
}
