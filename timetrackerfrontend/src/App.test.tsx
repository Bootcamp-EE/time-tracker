import React from 'react';
import { render, cleanup, waitForElement } from '@testing-library/react'
import App from './App';
import apiClient from './apiClient';
import { AxiosStatic } from 'axios';

jest.mock('./apiClient');
const mockedClient = apiClient as jest.Mocked<AxiosStatic>

afterEach(cleanup)

describe('This will test App Component', () => {
    test('renders Hello World', async () => {
        mockedClient.get.mockResolvedValueOnce({
            data: { message: 'Hello, world!' } as any,
        })
        const { getByText, container } = render(<App />)
        const element = await waitForElement(() => getByText("Hello, world!"));

        expect(mockedClient.get).toHaveBeenCalledTimes(1)
        expect(element).toBeInTheDocument();
        expect(container.firstChild).toHaveClass('App');
    });
})

